/*************************************************/
/* Script to create CuisineMoi ! database tables */
/*      Create by : Adame Naji - 10/11/2020      */
/*************************************************/


/***************/
/* Main tables */
/***************/

/* Application user information */
CREATE TABLE IF NOT EXISTS `User`
(
    id         INT          NOT NULL,
    name       VARCHAR(100),
    first_name VARCHAR(100) NOT NULL,
    email      VARCHAR(255) NOT NULL,
    password   VARCHAR(255) NOT NULL,

    /* Primary Key */
    CONSTRAINT `Pk_User`
    PRIMARY KEY (id)
    );

/* Information on a food */
CREATE TABLE IF NOT EXISTS `Food`
(
    id             INT          NOT NULL,
    name           VARCHAR(100) NOT NULL,
    type           VARCHAR(100) NOT NULL,
    monthBeginning INT          NOT NULL,
    monthEnd       INT          NOT NULL,

    /* Primary Key */
    CONSTRAINT `Pk_Food`
    PRIMARY KEY (id)
    );

/* Information about a recipe */
CREATE TABLE IF NOT EXISTS `Recipe`
(
    id    INT          NOT NULL,
    name  VARCHAR(100) NOT NULL,
    image VARCHAR(150) NOT NULL,
    time  INT,

    /* Primary Key */
    CONSTRAINT `Pk_Recipe`
    PRIMARY KEY (id)
    );

/* Information about a step in a recipe */
CREATE TABLE IF NOT EXISTS `Step`
(
    id          INT          NOT NULL,
    instruction VARCHAR(255) NOT NULL,

    /* Primary Key */
    CONSTRAINT `Pk_Step`
    PRIMARY KEY (id)
    );


/*****************************************/
/* Association tables of the main tables */
/*****************************************/

/* Association of the user and food forbidden (allergy, taste, etc.). */
CREATE TABLE IF NOT EXISTS `Assoc_ProhibitedFood_User`
(
    id      INT NOT NULL,
    fk_user INT,
    fk_food INT,

    /* Primary Key */
    CONSTRAINT `Pk_Assoc_ProhibitedFood_User`
    PRIMARY KEY (id),

    /* Foreign table keys  */
    CONSTRAINT `Fk_User_AssocProhibitedFoodUser`
    FOREIGN KEY (fk_user) REFERENCES User (id)
    ON DELETE CASCADE,

    CONSTRAINT `Fk_Food_AssocProhibitedFoodUser`
    FOREIGN KEY (fk_food) REFERENCES Food (id)
    ON DELETE CASCADE
    );

/* Table associating food to a user to make a shopping list */
CREATE TABLE IF NOT EXISTS `ShoppingList`
(
    id       INT NOT NULL,
    fk_user  INT,
    fk_food  INT,
    quantity INT,
    unity    VARCHAR(50),

    /* Primary Key */
    CONSTRAINT `Pk_ShoppingList`
    PRIMARY KEY (id),

    /* Foreign table keys  */
    CONSTRAINT `Fk_User_ShoppingList`
    FOREIGN KEY (fk_user) REFERENCES User (id)
    ON DELETE CASCADE,

    CONSTRAINT `Fk_Food_ShoppingList`
    FOREIGN KEY (fk_food) REFERENCES Food (id)
    ON DELETE CASCADE
    );

/* Shopping list for a user according to the menus of the week */
CREATE TABLE IF NOT EXISTS `Assoc_Food_Recipe`
(
    id        INT NOT NULL,
    fk_recipe INT,
    fk_food   INT,
    quantity  INT,
    unity     VARCHAR(50),

    /* Primary Key */
    CONSTRAINT `Pk_Assoc_Food_Recipe`
    PRIMARY KEY (id),

    /* Foreign table keys  */
    CONSTRAINT `Fk_User_AssocFoodRecipe`
    FOREIGN KEY (fk_recipe) REFERENCES Recipe (id)
    ON DELETE CASCADE,

    CONSTRAINT `Fk_Food_AssocFoodRecipe`
    FOREIGN KEY (fk_food) REFERENCES Food (id)
    ON DELETE CASCADE
    );

/* Association between a recipe and the steps that compose it */
CREATE TABLE IF NOT EXISTS `Assoc_Recipe_Step`
(
    id              INT NOT NULL,
    fk_recipe       INT,
    fk_step         INT,
    order_in_recipe INT,

    /* Primary Key */
    CONSTRAINT `Pk_Assoc_Recipe_Step`
    PRIMARY KEY (id),

    /* Foreign table keys  */
    CONSTRAINT `Fk_User_AssocRecipeStep`
    FOREIGN KEY (fk_recipe) REFERENCES Recipe (id)
    ON DELETE CASCADE,

    CONSTRAINT `Fk_Food_AssocRecipeStep`
    FOREIGN KEY (fk_step) REFERENCES Step (id)
    ON DELETE CASCADE
    );

/* Table allowing the storage of a meal */
CREATE TABLE IF NOT EXISTS `Meals_Of_The_Week`
(
    id        INT NOT NULL,
    fk_user   INT,
    fk_recipe INT,
    nb_people INT,
    to_do     BOOLEAN,

    /* Primary Key */
    CONSTRAINT `Pk_Meals_Of_The_Week`
    PRIMARY KEY (id),

    /* Foreign table keys  */
    CONSTRAINT `Fk_User_MealsOfTheWeek`
    FOREIGN KEY (fk_recipe) REFERENCES Recipe (id)
    ON DELETE CASCADE,

    CONSTRAINT `Fk_Food_MealsOfTheWeek`
    FOREIGN KEY (fk_user) REFERENCES User (id)
    ON DELETE CASCADE
    );
