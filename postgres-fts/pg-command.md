CREATE DATABASE im;

-- create the extension

CREATE EXTENSION zhparser;

-- make test configuration using parser

CREATE TEXT SEARCH CONFIGURATION testzhcfg (PARSER = zhparser);

-- add token mapping

ALTER TEXT SEARCH CONFIGURATION testzhcfg ADD MAPPING FOR n,v,a,i,e,l WITH simple;
