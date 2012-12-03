package pjbugsdb

class Member {

    String forename
    String surname
    String email
    Date joinedOn
    Date dateOfBirth
    String country
    String region
    String siteUserpage
    String siteUsername

    static constraints = {
        forename blank: false
        surname blank: false
        email email: true, blank: false
        joinedOn()
        dateOfBirth()
        country()
        region()
        siteUsername()
        siteUserpage: boolean
    }
}
