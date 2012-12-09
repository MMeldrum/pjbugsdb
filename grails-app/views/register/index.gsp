<html>

    <head>
        <meta name='layout' content='main'/>
        <title><g:message code='spring.security.ui.register.title'/></title>
    </head>

    <body>
        <div id='login'>
            <div class='inner'>
                <s2ui:form width='650' height='300' elementId='loginFormContainer'
                           titleCode='spring.security.ui.register.description' center='true'>

                <g:form action='register' name='registerForm'>

                    <g:if test='${emailSent}'>
                        <p>
                            <g:message code='spring.security.ui.register.sent'/>
                        </p>
                    </g:if>
                    <g:else>

                        <p>
                            <s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${command}"
                                             size='40' labelCodeDefault='Username' value="${command.username}"/>
                        </p>
                        <p>
                            <s2ui:textFieldRow name='email' bean="${command}" value="${command.email}"
                                               size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>
                        </p>
                        <p>
                            <s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${command}"
                                                 size='40' labelCodeDefault='Password' value="${command.password}"/>
                        </p>
                        <p>
                            <s2ui:passwordFieldRow name='password2' labelCode='user.password2.label' bean="${command}"
                                                 size='40' labelCodeDefault='Password (again)' value="${command.password2}"/>
                        </p>
                        <fieldset class="buttons">
                            <s2ui:submitButton elementId='create' form='registerForm' messageCode='spring.security.ui.register.submit'/>
                        </fieldset>
                    </g:else>

                </g:form>

                </s2ui:form>
                <script>
                $(document).ready(function() {
                    $('#username').focus();
                });
                </script>
            </div>
        </div>
    </body>
</html>
