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
        forename()
        surname()
        email email: true
        joinedOn()
        dateOfBirth()
        country()
        region nullable: true
        siteUsername nullable: true
        siteUserpage nullable: true
    }
}
