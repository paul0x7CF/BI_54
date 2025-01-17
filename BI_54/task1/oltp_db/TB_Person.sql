CREATE TABLE TB_Person (
    PersonID    INT          NOT NULL,
    FirstName   VARCHAR(50)  NOT NULL,
    MiddleName  VARCHAR(50)  NULL,
    LastName    VARCHAR(50)  NOT NULL,
    Gender      VARCHAR(1),            -- 'M' or 'F'
    Birthdate   DATE,
    CONSTRAINT PK_Person
        PRIMARY KEY (PersonID)
);
