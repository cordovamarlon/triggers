
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
    if NEW.nombre <> OLD.nombre then
	insert into modificaciones_agenda (codigoagenda,atributo_modificado,valor_antiguo_atributo,valor_nuevo_atributo,fecha_modificacion)
	values (OLD.idagenda, 'nombre', OLD.nombre, NEW.nombre, current_timestamp);
    end if;
    if NEW.apellidos <> OLD.apellidos THEN

        INSERT INTO modificaciones_agenda (codigoagenda,atributo_modificado,valor_antiguo_atributo,valor_nuevo_atributo,fecha_modicacion)
	values (OLD.idagenda, 'apellidos', OLD.apellidos,NEW.apellidos,current_timestamp);
    end if;

    if NEW.movil <> OLD.movil then

	insert into modificaciones_agenda (codigoagenda, atributo_modificado, valor_antiguo_atributo, valor_nuevo_atributo,fecha_modificacion)
	values (OLD.idagenda,'movil',OLD.movil,NEW.movil,current_timestamp);
    end if;

    if NEW.email <> OLD.email then

	insert into modificaciones_agenda (codigoagenda, atributo_modificado, valor_antiguo_atributo, valor_nuevo_atributo, fecha_modificacion)
	values (OLD.idagenda, 'email',OLD.email, NEW.email, current_timestamp);
    end if;
RETURN NEW;
END;
$$ language plpgsql;

create or replace trigger trig_modifica_bedore
before update on agenda
for each ROW
execute function trig_modifica_before();

