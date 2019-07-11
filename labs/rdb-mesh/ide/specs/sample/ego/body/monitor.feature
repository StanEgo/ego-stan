Feature: As a person
    I want to monitor some parameters
    So that will be able to figure out a progress

    Scenario: Monitor anthropometric data
        Given Add scope ego
        And Add scope body
        And Add monitor
        And Add description "Monitor anthropometric data"
        And Add parameter weight
        And Add parameter fat
        And Add alias log "monitor record weight=$1 and fat=$2"
        And Add schedule
        And Daily workdays at 06:30
        And Add alarm

        When clock is 2019-01-01
        And log 90.0 13.0
        When clock is 2019-01-02
        And log 89.8 12.9

        Then Monitor show:
            | Timestamp  | Weight | Fat  |
            | 2019-01-02 | 89.8   | 12.9 |
            | 2019-01-01 | 90.0   | 13.0 |
