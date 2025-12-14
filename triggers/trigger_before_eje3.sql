create or replace function trigger_before_eje3()
returns trigger as $$
begin

     if (NEW.stock < 0 ) then
	raise exception 'Los valores tienen que ser positivos';
     end if;

return NEW;
end;
$$ language plpgsql;

create or replace trigger trigger_before_eje3
before insert or update on productos
for each row
execute function trigger_before_eje3();
