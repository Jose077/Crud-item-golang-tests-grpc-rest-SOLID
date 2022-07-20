-- Table: public.item

-- DROP TABLE IF EXISTS public.item;

CREATE TABLE IF NOT EXISTS public.item
(
    id uuid NOT NULL,
    descricao character varying(250) COLLATE pg_catalog."default" NOT NULL,
    sn character varying(50) COLLATE pg_catalog."default",
    mac macaddr,
    imei character varying(50) COLLATE pg_catalog."default",
    criado_em timestamp with time zone NOT NULL DEFAULT now(),
    CONSTRAINT item_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.item
    OWNER to root;