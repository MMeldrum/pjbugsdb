<%@ page import="pjbugsdb.Member" %>



<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'country', 'error')} ">
    <label for="country">
        <g:message code="member.country.label" default="Country"/>

    </label>
    <g:textField name="country" value="${memberInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'dateOfBirth', 'error')} required">
    <label for="dateOfBirth">
        <g:message code="member.dateOfBirth.label" default="Date Of Birth"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dateOfBirth" precision="day" value="${memberInstance?.dateOfBirth}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="member.email.label" default="Email"/>

    </label>
    <g:textField name="email" value="${memberInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'forename', 'error')} ">
    <label for="forename">
        <g:message code="member.forename.label" default="Forename"/>

    </label>
    <g:textField name="forename" value="${memberInstance?.forename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'joinedOn', 'error')} required">
    <label for="joinedOn">
        <g:message code="member.joinedOn.label" default="Joined On"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="joinedOn" precision="day" value="${memberInstance?.joinedOn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'region', 'error')} ">
    <label for="region">
        <g:message code="member.region.label" default="Region"/>

    </label>
    <g:textField name="region" value="${memberInstance?.region}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'siteUsername', 'error')} ">
    <label for="siteUsername">
        <g:message code="member.siteUsername.label" default="Site Username"/>

    </label>
    <g:textField name="siteUsername" value="${memberInstance?.siteUsername}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'siteUserpage', 'error')} ">
    <label for="siteUserpage">
        <g:message code="member.siteUserpage.label" default="Site Userpage"/>

    </label>
    <g:textField name="siteUserpage" value="${memberInstance?.siteUserpage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'surname', 'error')} ">
    <label for="surname">
        <g:message code="member.surname.label" default="Surname"/>

    </label>
    <g:textField name="surname" value="${memberInstance?.surname}"/>
</div>

