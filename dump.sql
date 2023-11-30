-- Create the 'synthea' database
-- CREATE DATABASE synthea;

-- Connect to the 'synthea' database
\c synthea

CREATE USER api WITH PASSWORD 'jw8s0F4';
GRANT ALL PRIVILEGES ON DATABASE synthea TO api;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO api;


-- Create the 'patients' table
CREATE TABLE patients (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    family VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Create the 'users' table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);



        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '5ddcacd2-0664-466d-0f9c-1cf4d3e0fd0e',
            'Leon728',
            'Lind531',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '3907c6e0-c410-f7ab-cd91-423292dba137',
            'Nicolas769',
            'Walter473',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'd1db0572-3c7c-a497-a8ef-4c6e57832efe',
            'Bobby524',
            'Klocko335',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '24519634-c1d4-a4d4-24f3-9199fee1b846',
            'Gil594',
            'Reichel38',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '9fbbe977-a8bc-c24f-20d5-e42d6a37a6a7',
            'Armando772',
            'Bogan287',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '6a343bb4-31fb-aaf2-4216-03a680cbe3a5',
            'Loretta235 Joya53',
            'Bradtke547',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '743f6e27-eef1-e4ba-e96f-2b128e062b9e',
            'Damon455',
            'Boyer713',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '22d095e7-70aa-d4b4-b4c9-2dca2f08f503',
            'Eduardo902',
            'Bermúdez789',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '914836e3-8013-dc6b-0c5a-9d2b7dc8a825',
            'George991',
            'Gusikowski974',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '1ff53385-fc69-c9dc-1180-000fc83de250',
            'Hubert238',
            'Pagac496',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '91a4e065-7940-522d-6b02-8db663f8d028',
            'Roderick835',
            'King743',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '34f7461a-ce5e-b085-b21f-3b57d2e0e99f',
            'Cedrick207',
            'Kunde533',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '9c44db97-0db5-5de2-4b16-229788e7fa47',
            'Sammy219',
            'Feil794',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '81d01ee5-3405-c501-a156-8795b8c4a609',
            'Kennith515',
            'Veum823',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '58044608-1dc2-9b57-62b4-bb569cbd6aa2',
            'Juan88',
            'Corona300',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '96cea926-9a25-dd87-2eec-ab40e4de7985',
            'Florencio463',
            'Adams676',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'a87d0a93-f555-e663-14de-bcdc4d4c5852',
            'Eddy900',
            'Kautzer186',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '3e83dce7-a383-3306-940d-4cf7dafb03da',
            'Alanna27',
            'Weimann465',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'e0d889cb-9f6a-f504-a506-af61c8f3ebcd',
            'Winter723',
            'Ondricka197',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '00cb3188-4c9f-7781-3acc-f65b4e0462fc',
            'Laurene370',
            'OKeefe54',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'ecd14899-75ee-578b-06bf-a8ca10c19da2',
            'Kristina583 Kirstin394',
            'DAmore443',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'f9c5b6fa-7406-a726-0919-bb9a070863ec',
            'Stephan15',
            'OReilly797',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '13c9b37a-e4a2-aa0e-aee3-750c95b884b1',
            'Minta575 Elly836',
            'Sipes176',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '64c60c7d-65fc-a5e1-5445-cbfcac83e446',
            'Guillermina633 Conchita9',
            'Barrios478',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '6f7f91ab-150f-5ba2-8c41-630b92148db3',
            'Selene142',
            'Koch169',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '799ff48f-934b-3e47-f3ea-9b0edaa43c93',
            'Aaron697',
            'Welch179',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'efd8231c-13c1-20ff-6da3-4bc694e00d35',
            'Mitchel812',
            'Hegmann834',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'd8ffddcc-673b-a619-f944-f170176d9d77',
            'Thurman577',
            'Sanford861',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '357467a1-6c09-fb8c-da13-8bc20d803e27',
            'Jeffry142',
            'Towne435',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '3d0ba359-018d-8c68-dcb1-6f01abed9253',
            'Nancy265',
            'Dooley940',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '1434ce08-24d8-d117-3367-c85bc7f3f621',
            'Ardell826 Rima243',
            'Herman763',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '6be81c91-7995-c715-f1d4-48862119eecd',
            'Abbey813',
            'Gleichner915',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '6b679f59-8f81-51f9-be5c-47dfe67c46cd',
            'Enoch803',
            'Hartmann983',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'c4382995-7a94-50b7-efa4-50a25665b8ca',
            'Terrance440',
            'Cassin499',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'a63e496c-22c6-1edb-5d44-a57b86b94d21',
            'Neville893',
            'Davis923',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '17554ad8-442c-514f-882a-ea830a9e0678',
            'Patsy569 Carolann504',
            'Gutkowski940',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '5ebbf5a4-d6e3-9a68-7f1f-ec169da1c4c5',
            'Darell496',
            'Kirlin939',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '30e7a781-368a-c21c-c7b8-e7d933ffd589',
            'Cyril535',
            'Klein929',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '323d0780-7395-6891-fd21-6262a483a8af',
            'Colin861',
            'Sauer652',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '7869a1b2-2af3-ced0-625d-4c92e260d112',
            'Lenny728',
            'Nitzsche158',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '0e7cce2d-7d10-3a2a-1bc5-3eeec9361b59',
            'Judie557',
            'Rau926',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'faa51fc7-e131-0ebc-2540-1ef4d2b720a5',
            'Crysta430',
            'Bogisich202',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '9670ff78-3bcb-4509-ac89-a8ac4b123aa5',
            'Zackary401',
            'Mohr916',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '5bc32724-ab20-97bd-d33f-b8d048a0e62a',
            'Odell776',
            'Lebsack687',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '1b14801b-370f-11bf-4f11-440324f9f228',
            'Christoper325',
            'Nienow652',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '7cc79e80-07c3-7b79-54b3-748b8694d929',
            'Marina546',
            'Mitchell808',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '5f97730b-bc48-d0de-0ad1-8feef3f17af2',
            'Shanon591',
            'Hansen121',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '4ef847c6-4641-4fe8-2009-4e46f6e8c9bd',
            'Sherri495 Otelia900',
            'Ryan260',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'a8f27d01-0182-a129-2015-5163c1707168',
            'Ronald408',
            'Walker122',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '2ee4dedb-cb6c-1aca-1714-e8c3262a2975',
            'Sondra191 Shawn523',
            'Champlin946',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '80b43017-b138-5cbd-c55c-6301c2c71a85',
            'Filomena215 Mickey576',
            'Dach178',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '054b679c-c866-26f9-a843-9ba69c1bb15c',
            'Francis500',
            'Olson653',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'ff02f2eb-05f8-8ffe-8957-476c04fe5c22',
            'Adelle43 Gayle448',
            'Krajcik437',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'f233b409-8082-8140-c332-25e45b81d460',
            'Bart73',
            'Buckridge80',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '7c332137-0769-675a-0596-e55ee83a8788',
            'Rickey821',
            'OReilly797',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'c2a5b22e-5965-f170-c7ef-944c4e0b33f1',
            'Nana422',
            'Abshire638',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'c694ae77-92d3-1c11-c9ed-4f0c7addc239',
            'Janette321 Phyllis779',
            'Weber641',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '67d687c8-004c-973f-3249-f6a10a8ffff4',
            'Wilfred787',
            'Koepp521',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'fa995cc3-2f34-0aa3-3ef8-fe3934568473',
            'Sharyl439 Jenell974',
            'Kshlerin58',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '004bfbbd-5cd2-6ef2-8b01-0b502a7292dd',
            'Renaldo199',
            'Gutkowski940',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '6caa9de5-fab8-b11e-bf20-9fc19be81694',
            'Carlton317',
            'Harris789',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '87e6d0ff-cb9f-d048-7993-af710a4fbe94',
            'Penney623',
            'Prohaska837',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'ce5ff1c5-2833-71e6-cbea-21f9f08c0a38',
            'Gayle448',
            'Leannon79',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'a013b997-cb19-c807-f702-b154fad48942',
            'Isreal8',
            'Schoen8',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'd30e4a2b-93b3-ace2-7fe5-fdebc9907c01',
            'Ana972',
            'Negrón227',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'e81908ef-51ef-0160-d73a-7593aea57cac',
            'Christopher407 Oneida64',
            'Bogan287',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '150e3942-06ce-e005-f537-93a91c1fa767',
            'Douglas31',
            'Morar593',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'ca8b5f21-8a1a-5a83-4ef4-32bd200c48ae',
            'Carlota980',
            'Mateo562',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '934ec125-8149-cd16-961f-990290d0311c',
            'Greg949',
            'Purdy2',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '737f0a56-c3c7-966f-840d-b211702a45ed',
            'Akilah516',
            'Grady603',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'c84a0ae0-9606-0fee-ed71-3fa9ae748f9b',
            'Odis959',
            'Littel644',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '585f329d-8696-935d-6ca1-24d2e1158857',
            'Jude172',
            'Carroll471',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'd9ac5e08-c62f-0b0b-0908-13d338913deb',
            'Allan198',
            'McClure239',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '9c3f522f-a514-25cf-383d-d2b729c670a1',
            'Carl856',
            'OKon634',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '481b63a1-5e4d-bdba-b974-9964c094583e',
            'Alana17',
            'Bergnaum523',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'c5d2f178-adea-8059-8f20-ba86c31286f3',
            'Prudence900 Willie882',
            'Reilly981',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '8efb33c1-38e6-d67e-78b5-a9880b0aa47b',
            'Michael441',
            'Johnson679',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'f9f694f0-1947-acd5-6f36-6afd1e5ad393',
            'Karey608',
            'Walsh511',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '4af95a08-105d-811a-cd07-74cd297d7bc6',
            'Sharon747',
            'Thiel172',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'a6eab84c-df04-fdae-170c-943d629d2088',
            'Sanjuanita786 Caitlin552',
            'Okuneva707',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '66f46164-b3c8-9955-b36f-ec2e3886d370',
            'Norberto865',
            'Gleichner915',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '157f8b79-344d-3083-a6a3-448b74949bca',
            'Kathlyn335',
            'Sporer811',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '57a189c9-0185-96cd-d590-f581833ce5eb',
            'Gregoria352',
            'Monahan736',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'd7ce35d7-af5d-3402-ed52-f04e093dab70',
            'Marlon619',
            'Nitzsche158',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '45ae063d-e9e7-47ef-9b26-62c5829ad24e',
            'Anneliese170 Rochell365',
            'Sauer652',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '2f9b6a45-bd08-6b33-dbf1-27249b6ccbce',
            'Katharina121',
            'Huel628',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '6a444fa8-edad-6f1c-6c8d-8afff5856b77',
            'Korey682',
            'Johnson679',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '3e791219-0114-55f6-ef40-d2536d8aad3e',
            'Lang846',
            'Ullrich385',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '3feafa4a-0217-59c3-961c-d6b1caecbed8',
            'Rufus33',
            'Shields502',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '06226f97-9e42-6873-2847-0bd19f83e015',
            'Benjamín452',
            'Nieves278',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '4862d234-14ee-090e-5fd5-9bb8dbeae837',
            'Gustavo235',
            'Villegas15',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '08ab933f-d5e1-33ac-b1c2-96590139021d',
            'Harley673',
            'Bergstrom287',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '92d927fa-1c70-94f5-19d0-53a44050af87',
            'Kaye394',
            'Rodriguez71',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '1142c4b5-f107-7016-3b67-681824adc8be',
            'Devona405',
            'Veum823',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '12a57483-c69a-bb44-da99-d6c13004d8e0',
            'Lindsey52',
            'Schaden604',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '5526c414-74d5-149c-b5ae-28391b3dbc50',
            'Toby274',
            'Kessler503',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '87f44a39-7a5c-562b-9908-9524628762e0',
            'Levi940',
            'Hartmann983',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'e323ae0e-ce92-613f-f1e6-a549476088b5',
            'Rey54',
            'Deckow585',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'dae9be24-9454-bff8-d8be-2c420aebf4ac',
            'Marcos263',
            'Meza847',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'f6747adb-ab4a-17eb-8f22-4bee2b9fa4cc',
            'Brandee895 Lottie401',
            'Ziemann98',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'f53a3b1c-3e9d-f85d-710f-5125be5f298e',
            'Vida128',
            'Romaguera67',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '85066a90-9c8b-cc45-ed62-3a779a498e3b',
            'Germán350',
            'Posada6',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'd4749ef2-20d7-fad0-089b-bc45a6c7263f',
            'Daren950',
            'Hansen121',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'a82396b6-2775-0ec8-ec2c-4e6ff92aa0c9',
            'Elden718',
            'OKon634',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'b4659934-14a2-5ebc-0f49-3c2e714ce983',
            'Chandra831',
            'Emard19',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '5748016e-e87e-3a94-0f42-af488df816f0',
            'Lacie818',
            'Russel238',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '562c736b-7354-006f-240a-c835b647b7c9',
            'Zoraida650',
            'Macejkovic424',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '485a764d-bb16-063a-30d6-56d140ff6545',
            'Earlene410',
            'Reilly981',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '8eb6073e-a015-bec0-a23b-575a7af7bc30',
            'Gabriel934',
            'Frami345',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '31eb051b-b6c4-1792-5553-e27f7c216fc7',
            'Joaquin141',
            'Barton704',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '3c467b44-6367-cacc-1f00-736cd6af152e',
            'Eldridge510',
            'Dickinson688',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'e7500eab-5c23-d11d-0a03-f1eb731a75d0',
            'Doug189',
            'Lebsack687',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '83baa72e-8f37-9c93-ac0c-0df77849d116',
            'Veola813 Karon907',
            'Aufderhar910',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '2489ae50-5acc-560a-9f64-7e9d78bb6fe4',
            'Karissa612 Sommer719',
            'Haag279',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '45842680-1eb9-62f8-7d94-87cc9069e40b',
            'Jannette265',
            'Gleason633',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            '2dd8887d-6ce5-8c2b-0358-176a5c99cbac',
            'Ferdinand55',
            'Oberbrunner298',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'f902c0df-7cbd-91b4-257a-92d090cb4949',
            'Joycelyn213 Haydee844',
            'Walter473',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'e6c8dccd-9f88-9200-beb5-10c9fd995c9c',
            'Will178',
            'Ankunding277',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'b2d83b2f-7a32-637d-cb8e-fa5637f42b0b',
            'Lester513',
            'Mosciski958',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );

        INSERT INTO patients (id, name, family, create_at, update_at, delete_at)
        VALUES (
            'fbcc4cb9-8d51-9904-09b0-5550ad81c55b',
            'Fay398 Joshua658',
            'Fay398',
            NOW(), -- current timestamp for 'create_at'
            NOW(), -- current timestamp for 'update_at'
            NULL   -- 'delete_at' is left NULL since it's not deleted
        );
