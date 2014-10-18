@mod @mod_dataform @dataformactivity
Feature: Filtering

    @javascript
    Scenario: Filtering
        Given a fresh site with dataform "Test dataform filtering"
        And I log in as "teacher1"
        And I follow "Course 1"
        And I follow "Test dataform filtering"

        ## Add a text field.
        Then I go to manage dataform "fields"
        And I add a dataform field "text" with "Text field"

        ## Add an aligned view.
        Then I go to manage dataform "views"
        And I set the field "Add a view" to "aligned"
        And I expand all fieldsets
        And I set the field "Name" to "Aligned view"
        And I prepend "<p>##advancedfilter##</p>" to field "View template"
        And I press "Save changes"

        Then I set "Aligned view" as default view

        Then I follow "Browse"
        
        ## Add entries.
        Then I follow "Add a new entry"
        And I set the field "field_1_-1" to "Entry 01"
        And I press "Save"

        Then I follow "Add a new entry"
        And I set the field "field_1_-1" to "Entry 02"
        And I press "Save"

        Then I follow "Add a new entry"
        And I set the field "field_1_-1" to "Entry 03"
        And I press "Save"

        Then I follow "Add a new entry"
        And I set the field "field_1_-1" to "Entry 04"
        And I press "Save"

        Then I follow "Add a new entry"
        And I set the field "field_1_-1" to "Entry 05"
        And I press "Save"

        Then I follow "Add a new entry"
        And I set the field "field_1_-1" to "Entry 06"
        And I press "Save"

        ### Quick filtering ###

        ## Per page
        And I do not see "Quick filter"
        And I do not see "Next"
        And I do not see "Previous"

        Then I set the field "uperpage" to "1"
        And I see "Quick filter"
        And I see "Next"
        And I do not see "Previous"
        And I see "Entry 01"
        And I do not see "Entry 02"

        Then I click on ".page1 a" "css_element"
        And I see "Quick filter"
        And I see "Next"
        And I see "Previous"
        And I do not see "Entry 01"
        And I see "Entry 02"

        Then I set the field "uperpage" to "2"
        And I see "Quick filter"
        And I see "Next"
        And I see "Previous"
        And I do not see "Entry 01"
        And I do not see "Entry 02"
        And I see "Entry 03"
        And I see "Entry 04"

        Then I set the field "uperpage" to "3"
        And I see "Quick filter"
        And I do not see "Next"
        And I see "Previous"
        And I do not see "Entry 01"
        And I do not see "Entry 02"
        And I do not see "Entry 03"
        And I see "Entry 04"
        And I see "Entry 05"
        And I see "Entry 06"

        Then I set the field "id_filtersmenu" to "* Reset quick filter"
        And I do not see "Quick filter"
        And I do not see "Next"
        And I do not see "Previous"
        And I see "Entry 01"
        And I see "Entry 02"
        And I see "Entry 03"
        And I see "Entry 04"
        And I see "Entry 05"
        And I see "Entry 06"

        ## Quick search
        #Then I set the field "usearch" to "Entry 01"
        #And I press Enter on "usearch" "field"
        #And I see "Quick filter"
        #And I see "Entry 01"
        #And I do not see "Entry 02"

        ## Define and apply a standard filter

        # Add filter: Last 2 entries
        Then I go to manage dataform "filters"
        Then I follow "Add a filter"
        And I set the field "Name" to "Last 2 Entries"
        And I set the field "Per page" to "2"
        And I set sort criterion "1" to "1,content" "1"
        And I press "Save changes"
        And I see "Last 2 Entries"

        # Add filter: With "Entry 01" content
        Then I follow "Add a filter"
        And I set the field "Name" to "With Entry_01"
        And I set search criterion "1" to "AND" "1,content" "" "=" "Entry 01"
        And I press "Save changes"
        And I see "With Entry_01"

        # Add filter: With Entry 01 and Entry_05 content
        Then I follow "Add a filter"
        And I set the field "Name" to "With Entry_01 and Entry_05"
        And I set search criterion "1" to "AND" "1,content" "" "=" "Entry 01"
        And I set search criterion "2" to "AND" "1,content" "" "=" "Entry 05"
        And I press "Save changes"
        And I see "With Entry_01 and Entry_05"

        # Add filter: With Entry 01 or Entry_05 content
        Then I follow "Add a filter"
        And I set the field "Name" to "With Entry_01 or Entry_05"
        And I set search criterion "1" to "OR" "1,content" "" "=" "Entry 01"
        And I set search criterion "2" to "OR" "1,content" "" "=" "Entry 05"
        And I press "Save changes"
        And I see "With Entry_01 or Entry_05"

        # Browse and filter
        Then I follow "Browse"
        And I see "Entry 01"
        And I see "Entry 02"
        And I see "Entry 03"
        And I see "Entry 04"
        And I see "Entry 05"
        And I see "Entry 06"

        Then I set the field "id_filtersmenu" to "Last 2 Entries"
        And I see "Entry 05"
        And I see "Entry 06"
        And I do not see "Entry 01"
        And I do not see "Entry 02"

        Then I set the field "id_filtersmenu" to "With Entry_01"
        And I see "Entry 01"
        And I do not see "Entry 02"
        And I do not see "Entry 03"
        And I do not see "Entry 04"
        And I do not see "Entry 05"
        And I do not see "Entry 06"

        Then I set the field "id_filtersmenu" to "With Entry_01 and Entry_05"
        And I do not see "Entry 01"
        And I do not see "Entry 02"
        And I do not see "Entry 03"
        And I do not see "Entry 04"
        And I do not see "Entry 05"
        And I do not see "Entry 06"

        Then I set the field "id_filtersmenu" to "With Entry_01 or Entry_05"
        And I see "Entry 01"
        And I do not see "Entry 02"
        And I do not see "Entry 03"
        And I do not see "Entry 04"
        And I see "Entry 05"
        And I do not see "Entry 06"

        # Define and apply an advanced filter
        #-------------------------
        Then I follow "Aligned view"

        # Add filter: My Entry 01 or Entry_03 or Entry_06 content
        Then I follow "Advanced filter"
        And I set the field "Name" to "My Entry 01 or Entry_03 or Entry_06"
        And I set search criterion "1" to "OR" "1,content" "" "=" "Entry 03"
        And I set search criterion "2" to "OR" "1,content" "" "=" "Entry 01"
        And I set search criterion "3" to "OR" "1,content" "" "=" "Entry 06"
        And I press "Save changes"

        Then I follow "Aligned view"
        And I see "Entry 01"
        And I see "Entry 02"
        And I see "Entry 03"
        And I see "Entry 04"
        And I see "Entry 05"
        And I see "Entry 06"

        Then I set the field "id_filtersmenu" to "My Entry 01 or Entry_03 or Entry_06"
        And I see "Entry 01"
        And I do not see "Entry 02"
        And I see "Entry 03"
        And I do not see "Entry 04"
        And I do not see "Entry 05"
        And I see "Entry 06"

        Then I set the field "id_filtersmenu" to "* Reset saved filters"
        And I see "Entry 01"
        And I see "Entry 02"
        And I see "Entry 03"
        And I see "Entry 04"
        And I see "Entry 05"
        And I see "Entry 06"
