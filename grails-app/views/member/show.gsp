
<%@ page import="pjbugsdb.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-member" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                <li><a class="logout" href="${createLink(uri: '/logout')}"><g:message code="default.logout.label"/></a></li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </sec:ifAllGranted>
			</ul>
		</div>
		<div id="show-member" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list member">
			
				<g:if test="${memberInstance?.forename}">
				<li class="fieldcontain">
					<span id="forename-label" class="property-label"><g:message code="member.forename.label" default="Forename" /></span>
					
						<span class="property-value" aria-labelledby="forename-label"><g:fieldValue bean="${memberInstance}" field="forename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.surname}">
				<li class="fieldcontain">
					<span id="surname-label" class="property-label"><g:message code="member.surname.label" default="Surname" /></span>
					
						<span class="property-value" aria-labelledby="surname-label"><g:fieldValue bean="${memberInstance}" field="surname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="member.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${memberInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.joinedOn}">
				<li class="fieldcontain">
					<span id="joinedOn-label" class="property-label"><g:message code="member.joinedOn.label" default="Joined On" /></span>
					
						<span class="property-value" aria-labelledby="joinedOn-label"><g:formatDate format="yyyy-MM-dd" date="${memberInstance?.joinedOn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="member.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate format="yyyy-MM-dd" date="${memberInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="member.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${memberInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.region}">
				<li class="fieldcontain">
					<span id="region-label" class="property-label"><g:message code="member.region.label" default="Region" /></span>
					
						<span class="property-value" aria-labelledby="region-label"><g:fieldValue bean="${memberInstance}" field="region"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.siteUsername}">
				<li class="fieldcontain">
					<span id="siteUsername-label" class="property-label"><g:message code="member.siteUsername.label" default="Site Username" /></span>
					
						<span class="property-value" aria-labelledby="siteUsername-label"><g:fieldValue bean="${memberInstance}" field="siteUsername"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.siteUserpage}">
				<li class="fieldcontain">
					<span id="siteUserpage-label" class="property-label"><g:message code="member.siteUserpage.label" default="Site Userpage" /></span>
					
						<span class="property-value" aria-labelledby="siteUserpage-label"><g:fieldValue bean="${memberInstance}" field="siteUserpage"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${memberInstance?.id}" />
					<g:link class="edit" action="edit" id="${memberInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
