INSERT INTO public.lists_todo(id, description, created_at, finished_at, is_finished, creator_id, todolist_id) VALUES
    (1, 'eggs', '2019-11-20 00:17:42.954', NULL, false, NULL, 1),
    (2, 'celery', '2019-11-20 00:17:42.000', NULL, false, NULL, 1);
INSERT INTO public.lists_todolist (id, title, created_at, creator_id) VALUES
    (1, 'Buy foods', '2019-11-20 00:17:42.915', NULL);
