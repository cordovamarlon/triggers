

CREATE OR REPLACE FUNCTION trig_modifica_after()
RETURNS TRIGGER AS $$
BEGIN

	--REQUISITO 1: Rechazar cambio de PK
	-- AUNQUE SEA AFTER, si lanzamos error, se cancela todo

	if NEW.idagenda <> OLD.idagenda then
		RAISE EXCEPTION 'No se puede modificar el campo IDAGENDA (PRIMARY KEY)';
	end if;

	-- REQUISITO 2: Auditar cambios (La logica es identica al before)

	if NEW.nombre <> OLD.nombre then

		INSERT INTO modificaciones_agenda (codigoagenda, atributo_modificado, valor_antiguo_atributo, valor_nuevo_atributo, fecha_modificacion) 
		values (OLD.idagenda, 'nombre', OLD.nombre, NEW.nombre, current_timestamp);
	end if;

	if NEW.apellidos <> OLD.apellidos then

		insert into modificaciones_agenda (codigoagenda, atributo_modificado, valor_antiguo_atributo, valor_nuevo_atributo, fecha_modificacion)
		values (OLD.idagenda, 'apellidos', OLD.apellidos, NEW.apellidos, current_timestamp);
	end if;

	if NEW.movil <> OLD.movil then

		insert into modificaciones_agenda (codigoagenda, atributo_modificado, valor_antiguo_atributo, valor_nuevo_atributo,fecha_modificacion)
		values (OLD.idagenda, 'movil', OLD.movil, NEW.movil, current_timestamp);
	end if;

	if NEW.email <> OLD.email then

                insert into modificaciones_agenda (codigoagenda, atributo_modificado, valor_antiguo_atributo, valor_nuevo_atributo,fecha_modificacion)
                values (OLD.idagenda, 'email', OLD.movil, NEW.movil, current_timestamp);
        end if;

	return null;
end;
$$ language plpgsql;


CREATE or replace TRIGGER trig_modifica_after
AFTER UPDATE ON agenda
FOR EACH ROW
EXECUTE FUNCTION trig_modifica_after();
