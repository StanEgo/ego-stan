DO $$ BEGIN
    PERFORM test.assert_fn('test.view_projects_list()', '(greentube,project,Greentube)');
END $$;
