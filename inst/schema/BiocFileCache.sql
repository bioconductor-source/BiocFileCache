-- TABLE
CREATE TABLE resource (
    rid INTEGER PRIMARY KEY AUTOINCREMENT,
    rname text,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    access_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    rpath text, 
    rtype text, 
    weblink text,
    last_modified_time DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- INSERT
INSERT INTO resource (
    rname, rpath, rtype, weblink
) VALUES (
    '%s', '%s', '%s', '%s'
);
SELECT rid FROM resource WHERE ROWID = last_insert_rowid();
-- REMOVE
DELETE FROM resource WHERE rid IN (%s);
-- UPDATE_PATH
UPDATE resource 
SET rpath = '%s', access_time = CURRENT_TIMESTAMP
WHERE rid = '%d';
-- UPDATE_TIME
UPDATE resource 
SET access_time = CURRENT_TIMESTAMP
WHERE rid = '%d';
-- UPDATE_RNAME
UPDATE resource 
SET rname = '%s', access_time = CURRENT_TIMESTAMP
WHERE rid = '%d';
-- UPDATE_MODIFIED
UPDATE resource 
SET last_modified_time  = '%s', access_time = CURRENT_TIMESTAMP
WHERE rid = '%d';
-- UPDATE_WEBLINK
UPDATE resource 
SET weblink = '%s', access_time = CURRENT_TIMESTAMP
WHERE rid = '%d';
