<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Notes Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<form action="/task/filtrate" method="post">
    <p>
        <select size="3" multiple name="taskfiltres[]">
            <option name="doneTasks" value="${1}">DoneTasks</option>
            <option name="doneTasks" value="${0}">unDoneTasks</option>
            <option name="doneTasks" value="${-1}">allTasks</option>
        </select>
    </p>
    <p><input type="submit" value="filter"/></p>
</form>

<br/>
<form action="/tasks/sortDate" method="post">
    <p>
        For sort by the Date click -
    </p>
    <p><input type="submit" value="sort"/></p>
</form>
<h1>Notes List</h1>

<c:if test="${!empty listTasks}">
    <table class="tg">
        <tr>
            <th width="200">Description</th>
            <th width="80">isDone</th>
            <th width="80">Date</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
            <th width="60">Done</th>
        </tr>
        <c:forEach items="${listTasks}" var="task">
            <tr>
                <td><a href="/taskdata/${task.id}" target="_blank">${task.taskDescription}</a></td>
                <td><c:if test="${task.isDone==1}">Done</c:if>
                    <c:if test="${task.isDone==0}">unDone</c:if>
                </td>
                <td>${task.date.toLocaleString().substring(0,10)}</td>
                <td><a href="<c:url value='/edit/${task.id}'>
                            <c:param name="startPosition" value="${startPosition}"/>
                            <c:param name="numberOfTasksOnList" value="${numberOfTasksOnList}"/>
                        </c:url>">
                    Edit</a>
                </td>
                <td><a href="<c:url value='/remove/${task.id}'/>">Delete</a></td>
                <td><a href="<c:url value='/done/${task.id}'>
                            <c:param name="startPosition" value="${startPosition}"/>
                            <c:param name="numberOfTasksOnList" value="${numberOfTasksOnList}"/>
                        </c:url>">
                    Done</a></td>
            </tr>
        </c:forEach>
    </table>

    <br>

    <c:url value="/tasks" var="prev">
        <c:param name="startPosition" value="${startPosition-numberOfTasksOnList}"/>
        <c:param name="isSortNeed" value="${isSortNeed}"/>
        <c:param name="doneTasks" value="${doneTasks}"/>
    </c:url>
    <c:if test="${startPosition>0}">
        <a href='<c:out value="${prev}" />'>Prev</a>
    </c:if>


    <c:url value="/tasks" var="next">
        <c:param name="startPosition" value="${endPosition}"/>
        <c:param name="isSortNeed" value="${isSortNeed}"/>
        <c:param name="doneTasks" value="${doneTasks}"/>
    </c:url>
    <c:if test="${endPosition < maxPosition}">
        <a href='<c:out value="${next}" />'>Next</a>
    </c:if>

</c:if>



<h1>Add a Task</h1>

<c:url var="addAction" value="/tasks/add">
    <c:param name="startPosition" value="${startPosition}"/>
</c:url>

<form:form action="${addAction}" commandName="task">
    <table>
        <c:if test="${!empty task.taskDescription}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="taskDescription">
                    <spring:message text="Description"/>
                </form:label>
            </td>
            <td>
                <form:input path="taskDescription"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty task.taskDescription}">
                    <input type="submit"
                           value="<spring:message text="Edit Task"/>"/>
                </c:if>
                <c:if test="${empty task.taskDescription}">
                    <input type="submit"
                           value="<spring:message text="Add Task"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
