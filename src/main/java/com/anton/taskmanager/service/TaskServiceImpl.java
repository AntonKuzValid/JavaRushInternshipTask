package com.anton.taskmanager.service;

import com.anton.taskmanager.dao.TaskDao;
import com.anton.taskmanager.model.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {
    private TaskDao taskDao;

    public void setTaskDao(TaskDao taskDao) {
        this.taskDao = taskDao;
    }

    @Override
    @Transactional
    public void addTask(Task task) {
        this.taskDao.addTask(task);
    }

    @Override
    @Transactional
    public void updateTask(Task task) {
        this.taskDao.updateTask(task);
    }

    @Override
    @Transactional
    public void removeTask(int id) {
        this.taskDao.removeTask(id);
    }

    @Override
    @Transactional
    public Task getTaskById(int id) {
        return this.taskDao.getTaskById(id);
    }

    @Override
    @Transactional
    public List<Task> listTasks() {
        return this.taskDao.listTasks();
    }
}
