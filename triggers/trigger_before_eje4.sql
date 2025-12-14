create or replace function trigger_before_eje4()
returns trigger as $$
begin

      if (NEW.monto_total > 500) then

	NEW.descuento = 10;
      end if;

      if (NEW.monto_total > 1000) then

	NEW.descuento = 15;
      end if;

     if ( NEW.monto_total < 500 or NEW.monto_total < 1000) then
	NEW.descuento = 0;
     end if;
return NEW;
end;
$$ language plpgsql;

create or replace trigger trigger_before_eje4
before insert or update on facturas
for each row
execute function trigger_before_eje4();
