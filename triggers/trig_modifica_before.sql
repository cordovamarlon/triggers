CREATE OR REPLACE TRIGGER trig_modifica_before
BEFORE UPDATE ON agenda
FOR EACH ROW
EXECUTE PROCEDURE trig_modifica_before();




CREATE OR REPLACE FUNCTION trig_modifica_before()
RETURNS TRIGGER AS $$
BEGIN
	--REQUISITO 1: RECHAZAR CUALQUIER MODIFICACION DEL CAMPO IDAGFENDA
	--COMPROBAMOS EL ID NUEVO CON EL VIEJP
    if NEW.idagenda <> OLD.idagenda THEN

        RAISE EXCEPTION 'NO SE PUEDE MODIFICAR EL CAMPO IDAGENDA';

    end if;

      --REQUISITO 2: AUDITAR CAMPO POR CAMPO
      -- Si cambia el NOMBRE

    if NEW.apellidos <> OLD.apellidos THEN

        INSERT INTO modificaciones_agenda (codigoagenda,atributo_modificado,valor_antiguo_atributo,valor_nuevo_atributo,fecha_modicacion)
	values (OLD.idagenda, 'nombre', OLD.nombre,NEW.nombre,current_timestamp )
