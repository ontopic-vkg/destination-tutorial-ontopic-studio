create user ontobras password 'ontoptutorial';
grant connect on database postgres to ontobras;
grant usage on schema source1 to ontobras;
grant usage on schema source2 to ontobras;
grant select on all tables in schema source1 to ontobras;
grant select on all tables in schema source2 to ontobras;
