CREATE TABLE TB_Country (
    CountryID   INT            NOT NULL,
    Country     VARCHAR(50)    NOT NULL,
    Region      VARCHAR(50)    NOT NULL,
    TaxRate     DECIMAL(13,4)  NOT NULL,
    ShipCoeff   DECIMAL(13,4)  NOT NULL,
    CONSTRAINT PK_Country
        PRIMARY KEY (CountryID)
);