use dummy;
select * from payments;
select * from currencies;
select * from exchange_rates;

insert into exchange_rates
values(222,0.19,'2023-01-05');
insert into exchange_rates
values(222,0.2,'2023-02-05');
insert into exchange_rates
values(222,0.21,'2023-03-05');
insert into exchange_rates
values(111,1,'2023-01-05');
insert into exchange_rates
values(111,1,'2023-02-05');
insert into exchange_rates
values(111,1,'2023-03-05');


insert into exchange_rates
values(333,0.04245,'2023-01-05');
insert into exchange_rates
values(333,0.04238,'2023-02-05');
insert into exchange_rates
values(333,0.04255,'2023-03-05');
insert into exchange_rates
values(444,0.1327,'2023-01-05');
insert into exchange_rates
values(444,0.1327,'2023-02-05');
insert into exchange_rates
values(444,0.1327,'2023-03-05');




select sum(amount*er.exchange_rate_to_eur) as tot_amt_in_euros,transaction_date from payments p
inner join blacklist b
on b.user_id!=p.user_id_sender
inner join currencies cur on cur.currency_id=p.currency and cur.end_date is null
inner join exchange_rates er where er.currency_id = p.currency and er.exchange_date=p.transaction_date
group by transaction_date