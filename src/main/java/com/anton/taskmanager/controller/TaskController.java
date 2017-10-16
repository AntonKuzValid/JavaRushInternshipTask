package com.anton.taskmanager.controller;

import com.anton.taskmanager.model.Task;
import com.anton.taskmanager.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Controller
public class TaskController {
    private TaskService taskService;

    @Autowired(required = true)
    @Qualifier(value = "taskService")
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @RequestMapping(value = "tasks")
    public String listTasks(@RequestParam(value = "startPosition", required = false) Integer startPosition,
                            @RequestParam(value = "doneTasks", required = false) Integer doneTasks,
                            @RequestParam(value = "isSortNeed", required = false) Boolean isSortNeed,
                            Model model){
        int numberOfTasksOnList=10;
        List<Task> taskList =this.taskService.listTasks();
        if (doneTasks!=null){
            List<Task> newTaskList =new ArrayList<>();
            if (doneTasks.equals(1)){
                for (Task task : taskList){
                    if (task.getDone()==1) newTaskList.add(task);
                }
            }
            else {
                for (Task task : taskList){
                    if (task.getDone()!=1) newTaskList.add(task);
                }
            }
            taskList = newTaskList;
        }
        startPosition=startPosition==null?0:startPosition;
        int endPosition =startPosition+numberOfTasksOnList> taskList.size()? taskList.size():startPosition+numberOfTasksOnList;

        if(isSortNeed!=null&&isSortNeed.equals(true)){
            taskList.sort(new Comparator<Task>() {
                @Override
                public int compare(Task o1, Task o2) {
                    if (o1.getDate().after(o2.getDate())) return -1;
                    else if (o1.getDate().before(o2.getDate())) return 1;
                    return 0;
                }
            });
        }

        model.addAttribute("numberOfTasksOnList",numberOfTasksOnList);
        model.addAttribute("maxPosition", taskList.size());
        model.addAttribute("startPosition", startPosition);
        model.addAttribute("endPosition", endPosition);
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", taskList.subList(startPosition,endPosition));
        model.addAttribute("doneTasks",doneTasks);
        model.addAttribute("isSortNeed",isSortNeed);
        return "tasks";
    }

    @RequestMapping(value = "/tasks/add", method = RequestMethod.POST)
    public String addTask(@ModelAttribute("task") Task task,
    @RequestParam(value = "startPosition", required = false) Integer startPosition,
                          Model model){
        if(task.getId() == 0){
            this.taskService.addTask(task);
        }else {
            this.taskService.updateTask(task);
        }
        model.addAttribute("startPosition", startPosition);
        return "redirect:/tasks";
    }

    @RequestMapping("/remove/{id}")
    public String removeTask(@PathVariable("id") int id,
                             Model model){
        this.taskService.removeTask(id);

        return "redirect:/tasks";
    }

    @RequestMapping("edit/{id}")
    public String editTask(@RequestParam(value = "startPosition", required = false) Integer startPosition,
                           @RequestParam(value = "numberOfTasksOnList") Integer numberOfTasksOnList,
                           @PathVariable("id") int id, Model model){

        List<Task> taskList =this.taskService.listTasks();
        startPosition=startPosition==null?0:startPosition;
        int endPosition =startPosition+numberOfTasksOnList> taskList.size()? taskList.size():startPosition+numberOfTasksOnList;

        model.addAttribute("numberOfTasksOnList",numberOfTasksOnList);
        model.addAttribute("maxPosition", taskList.size());
        model.addAttribute("startPosition", startPosition);
        model.addAttribute("endPosition", endPosition);
        model.addAttribute("task", this.taskService.getTaskById(id));
        model.addAttribute("listTasks", taskList.subList(startPosition,endPosition));

        return "tasks";
    }

    @RequestMapping("done/{id}")
    public String markTaskDone(@RequestParam(value = "startPosition", required = false) Integer startPosition,
                           @RequestParam(value = "numberOfTasksOnList") Integer numberOfTasksOnList,
                           @PathVariable("id") int id, Model model){
        Task newTask= this.taskService.getTaskById(id);
        newTask.setIsDone(1);
        this.taskService.updateTask(newTask);

        List<Task> taskList =this.taskService.listTasks();
        startPosition=startPosition==null?0:startPosition;
        int endPosition =startPosition+numberOfTasksOnList> taskList.size()? taskList.size():startPosition+numberOfTasksOnList;

        model.addAttribute("numberOfTasksOnList",numberOfTasksOnList);
        model.addAttribute("maxPosition", taskList.size());
        model.addAttribute("startPosition", startPosition);
        model.addAttribute("endPosition", endPosition);
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", taskList.subList(startPosition,endPosition));
        return "tasks";
    }

    @RequestMapping("taskdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model){
        model.addAttribute("task", this.taskService.getTaskById(id));

        return "taskdata";
    }

    @RequestMapping(value = "/task/filtrate")
    public String filtrBooks(@RequestParam("taskfiltres[]") Integer[] doneTasks,
                            Model model){
        if (doneTasks[0]==-1) return listTasks(0,null, null,model);
        return listTasks(0,doneTasks[0],null,model);
    }

    @RequestMapping(value = "/tasks/sortDate")
    public String sortBooksByDate(Model model){
        return listTasks(0,null,true,model);
    }
}
