-- create or update a new client when insert new data in prospect table
-- 2024-05-27
-- Patricio Araneda
CREATE TRIGGER trg_UpsertClient
ON prospect
AFTER INSERT
AS
BEGIN
    -- update record in 'clients'
    UPDATE c
    SET c.nombre = i.nombre_cotizante,
        c.mail = i.mail,
        c.nacimiento = i.Nacimiento,
        c.edad = i.edad,
        c.comuna = i.comuna,
        c.region = i.region,
        c.ingresorenta = i.renta,
        c.genero = i.genero
    FROM clients c
    JOIN inserted i ON c.rut_cliente = i.rut_cliente;

    -- insert new record in 'clients'
    INSERT INTO clients (nombre, rut, mail, nacimiento, edad, comuna, region, ingresorenta, genero)
    SELECT i.nombre, i.rut, i.mail, 
    i.Nacimiento, i.edad, i.comuna, i.region, 
    i.renta, i.genero
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1 FROM clients c WHERE c.rut_cliente = i.rut_cliente
    );
END;
