CREATE TABLE Readers (
    reader_id SERIAL PRIMARY KEY,
    surname VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    patronymic VARCHAR(50),
    birth_date DATE NOT NULL,
    passport VARCHAR(20) UNIQUE NOT NULL,
    address VARCHAR(150),
    phone VARCHAR(20)
);

CREATE TABLE Fines (
    reader_id INTEGER NOT NULL,
    return_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    book_lost BOOLEAN DEFAULT FALSE,
    fine NUMERIC(10,2) NOT NULL DEFAULT 0,

    CONSTRAINT fk_reader
    FOREIGN KEY (reader_id)
    REFERENCES Readers(reader_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT check_status
    CHECK (status IN ('Оплачен', 'Не оплачен')),

    CONSTRAINT check_fine
    CHECK (fine >= 0)
);
