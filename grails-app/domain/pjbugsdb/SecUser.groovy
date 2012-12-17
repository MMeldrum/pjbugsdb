package pjbugsdb

class SecUser {

    transient springSecurityService

    String username
    String password
    boolean enabled
    String email
    String firstName
    String lastName
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

//    Member member

    static constraints = {
        username unique: true
        email email: true
//        member nullable: true
    }

    static mapping = {
        password column: '`password`'
    }

    Set<SecRole> getAuthorities() {
        SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
