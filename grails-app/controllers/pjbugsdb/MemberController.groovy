package pjbugsdb

import org.springframework.dao.DataIntegrityViolationException

import grails.plugins.springsecurity.Secured

class MemberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index() {
        def authorities = springSecurityService.currentUser.authorities
        def foundAdmin = false

        for (secrole in authorities) {
            if (secrole.authority.equals("ROLE_ADMIN")) {
                println "found admin"
                foundAdmin = true
            }
        }

        if (!foundAdmin) {
//            if (springSecurityService.currentUser.member){
//                params.id = springSecurityService.currentUser.member?.id
//                params.action = "show"
//                println "you are member id "+params.id
//                redirect(action: "show", params: params)
//            } else {
//                println "add member!"
//                redirect(action: "create", params: params)
//            }
//        } else {
//            println "you're admin - here's the list"
            redirect(action: "list", params: params)
        }
    }

    @Secured(['ROLE_ADMIN'])
    def list(Integer max) {
            params.max = Math.min(max ?: 10, 100)
            [memberInstanceList: Member.list(params), memberInstanceTotal: Member.count()]
    }

    @Secured(['ROLE_USER'])
    def create() {
        [memberInstance: new Member(params)]
    }

    @Secured(['ROLE_USER'])
    def save() {
        def memberInstance = new Member(params)
        springSecurityService.currentUser.member = memberInstance
        if (!memberInstance.save(flush: true)||!springSecurityService.currentUser.save(flush: true)) {
            render(view: "create", model: [memberInstance: memberInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
        redirect(action: "show", id: memberInstance.id)
    }

    @Secured(['ROLE_USER'])
    def show(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        [memberInstance: memberInstance]
    }

    @Secured(['ROLE_USER'])
    def edit(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        [memberInstance: memberInstance]
    }

    @Secured(['ROLE_USER'])
    def update(Long id, Long version) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (memberInstance.version > version) {
                memberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'member.label', default: 'Member')] as Object[],
                          "Another user has updated this Member while you were editing")
                render(view: "edit", model: [memberInstance: memberInstance])
                return
            }
        }

        memberInstance.properties = params

        if (!memberInstance.save(flush: true)) {
            render(view: "edit", model: [memberInstance: memberInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
        redirect(action: "show", id: memberInstance.id)
    }

    @Secured(['ROLE_USER'])
    def delete(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        try {
            def secuser = SecUser.findByMember(memberInstance)
            if (secuser != null){
//                secuser.member = null
                secuser.save(flush: true)
            }
            memberInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "show", id: id)
        }
    }
}
