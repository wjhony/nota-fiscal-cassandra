CREATE KEYSPACE invoice
	WITH replication = { 
		'class': 'SimpleStrategy', 
		'replication_factor': 3 
	};

USE invoice;

CREATE TABLE invoice_item(
    invoice_number bigint,
    invoice_total double STATIC,
    client_name text STATIC,
    client_address text STATIC,
    service_description text,
    quantity int,
    unit_value double,
    resource_name text,
    resource_qualifications set<text>,
    tax_percent double,
    discount_percent double,
    subtotal double,
    reference_date date,
    PRIMARY KEY(
        (invoice_number),
        reference_date, service_description, resource_name
    )
);

CREATE INDEX ON invoice_item(reference_date);
CREATE INDEX ON invoice_item(service_description);
CREATE INDEX ON invoice_item(resource_name);