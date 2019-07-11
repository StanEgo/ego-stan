/**
    Scope is a part of something where I'd like to invest my activities
    and abilities. It can be attached to anything. For example scope of
    the person can be its skills. Scope of the "Skills" scope can be
    "Playing guitar". We can split software project into different scopes
    like "UI", "Backend", etc.

    mutation addScope(target) { ... }

    We can select all scope for the selected object, but also would like
    to fetch only "skills" for instance.

    query getScopesFor(id, type: optional) { ... }
*/