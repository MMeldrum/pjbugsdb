import pjbugsdb.Member
import pjbugsdb.SecRole
import pjbugsdb.SecUser
import pjbugsdb.SecUserSecRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

//        def martin = Member.findByEmail('martin.meldrum@gmail.com') ?: new Member(forename: 'Martin', surname: 'Meldrum', email: 'martin.meldrum@gmail.com',
//                country: 'UK', region: 'Fife', dateOfBirth: new Date(), joinedOn: new Date(),
//                siteUserpage: 'martin', siteUsername: 'martin').save(failOnError: true)

//        def mirella = new Member(forename: 'Mirella', surname: 'van der Made', email: 'mirella12@xs4all.nl',
//                country: 'NL', region: 'IHaveNoIdea', dateOfBirth: new Date(), joinedOn: new Date(),
//                siteUserpage: 'mirella', siteUsername: 'mirella').save(failOnError: true)

        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                password: 'password',
                firstName: 'Admin',
                lastName: 'User',
                email: 'admin@igotbugs.net',
//                member:  null,
                enabled: true).save(failOnError: true)

//        def martinUser = SecUser.findByUsername('martin') ?: new SecUser(
//                username: 'martin',
//                password: 'secret',
//                firstName: 'Martin',
//                lastName: 'Meldrum',
//                email: 'martin.meldrum@gmail.com',
//                member:  martin,
//                enabled: true).save(failOnError: true)

//        def mirellaUser = SecUser.findByUsername('mirella') ?: new SecUser(
//                username: 'mirella',
//                password: 'secret',
//                firstName: 'Mirella',
//                lastName: 'van der Made',
//                email: 'mirella2@xs4all.nl',
////                member:  mirella,
//                member:  null,
//                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }
        if (!adminUser.authorities.contains(userRole)) {
            SecUserSecRole.create adminUser, userRole
        }
//        if (!martinUser.authorities.contains(userRole)) {
//            SecUserSecRole.create martinUser, userRole
//        }
//        if (!adminUser.authorities.contains(mirellaUser)) {
//            SecUserSecRole.create mirellaUser, userRole
//        }
    }

    def destroy = {
    }
}
