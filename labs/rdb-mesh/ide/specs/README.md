# Gherkin conventions

## Given

### User {id}

Creates the user {id} in the database without an UI representation.
User is an Entity type.

### {entityId} has {aspect} {aspectIdAndName}

Creates a new {aspect} {aspectIdAndName} and adds a link to the {entityId} without an UI representation.

### {entityId} is {aspect}

Makes {entityId} to have an {aspect} without an UI representation.

### Focus is {id}

Sets the current focus to the {id} without an UI representation.

### Current user is {userId}

WORK: Current user is set to {userId} without an UI representation.

### IMAP has mail MailId

WORK:

## When

### Select {ILinkInheritor | ILinkInheritor/ILinkInheritor}

Clicks on {ILinkInheritor} inside the navigation.

### Add {ILinkInheritor | ILinkInheritor/ILinkInheritor} {ILinkInheritorIdAndName}

* Turns navigation in to the "Add mode" by clicking the "Plus icon".
* Doubleclicks on {ILinkInheritor} in navigation.
* Fills in {ILinkInheritorIdAndName} in the form.
* Submits the form.

### Add aspect {ILinkInheritor}

* Turns navigation in to the "Add mode" by clicking the "Plus icon".
* Drags {ILinkInheritor} from the navigation to the main view.

### Configure Widget Mail $table

Performs an action "Configure" with $table data on the Widget Mail.

### Sync Widget Mail

Performs an action "Sync" on the Widget Mail.

## Then

### Widget {id} list $table

Makes sure that {id} widget has the data from the $table.

### Widget {widgetId} list has {entityId}

Makes sure that {widgetId} widget has the {entityId}.

### Focus is {id}

Makes sure that the current focus is equal to the {id}.