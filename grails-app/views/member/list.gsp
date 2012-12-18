
<%@ page import="pjbugsdb.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-member" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                <li><a class="logout" href="${createLink(uri: '/logout')}"><g:message code="default.logout.label"/></a></li>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-member" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="forename" title="${message(code: 'member.forename.label', default: 'Forename')}" />
					
						<g:sortableColumn property="surname" title="${message(code: 'member.surname.label', default: 'Surname')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'member.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="joinedOn" title="${message(code: 'member.joinedOn.label', default: 'Joined On')}" />
					
						<g:sortableColumn property="dateOfBirth" title="${message(code: 'member.dateOfBirth.label', default: 'Date Of Birth')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'member.country.label', default: 'Country')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${memberInstanceList}" status="i" var="memberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: memberInstance, field: "forename")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "surname")}</td>
					
						<td><g:link action="show" id="${memberInstance.id}">${fieldValue(bean: memberInstance, field: "email")}</g:link></td>
					
						<td><g:formatDate format="dd-MMM-yyyy" date="${memberInstance.joinedOn}" /></td>
					
						<td><g:formatDate format="dd-MMM-yyyy" date="${memberInstance.dateOfBirth}" /></td>
					
						<td><g:country code="${memberInstance.country}"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${memberInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
