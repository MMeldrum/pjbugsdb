import pjbugsdb.SecRole
import pjbugsdb.SecUser
import pjbugsdb.SecUserSecRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        println "password"+springSecurityService.encodePassword("password")
        println "secret"+springSecurityService.encodePassword("secret")

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
            SecUserSecRole.create adminUser, userRole
        }
    }

    def destroy = {
    }
}
