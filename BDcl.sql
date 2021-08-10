/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  28/06/2021 10:49:14                      */
/*==============================================================*/


DROP TABLE IF EXISTS CENTRE_DISTRIBUTION;

DROP TABLE IF EXISTS CLIENTS;

DROP TABLE IF EXISTS COMPRENDRE;

DROP TABLE IF EXISTS CORRESPONDRE;

DROP TABLE IF EXISTS FACTURE;

DROP TABLE IF EXISTS INSERER;

DROP TABLE IF EXISTS MARCHANDISES;

DROP TABLE IF EXISTS PANIER;

DROP TABLE IF EXISTS POSSEDER;

DROP TABLE IF EXISTS STOCKS;

DROP TABLE IF EXISTS VENTE;

/*==============================================================*/
/* Table : CENTRE_DISTRIBUTION                                  */
/*==============================================================*/
CREATE TABLE CENTRE_DISTRIBUTION
(
   IDCENTDISTRIB        VARCHAR(20) NOT NULL,
   RESPCENTDISTRIB      VARCHAR(30) NOT NULL,
   PRIMARY KEY (IDCENTDISTRIB)
);

/*==============================================================*/
/* Table : CLIENTS                                              */
/*==============================================================*/
CREATE TABLE CLIENTS
(
   IDCLI                VARCHAR(30) NOT NULL,
   IDPANIER             VARCHAR(20) NOT NULL,
   IDFACURE             VARCHAR(25) NOT NULL,
   NOMCLI               VARCHAR(30) NOT NULL,
   ADRESSECLI           VARCHAR(30) NOT NULL,
   PRENOMCLI            VARCHAR(25) NOT NULL,
   NUMTELCLI            VARCHAR(25) NOT NULL,
   PRIMARY KEY (IDCLI)
);

/*==============================================================*/
/* Table : COMPRENDRE                                           */
/*==============================================================*/
CREATE TABLE COMPRENDRE
(
   IDCENTDISTRIB        VARCHAR(20) NOT NULL,
   IDVENTE              VARCHAR(20) NOT NULL,
   PRIMARY KEY (IDCENTDISTRIB, IDVENTE)
);

/*==============================================================*/
/* Table : CORRESPONDRE                                         */
/*==============================================================*/
CREATE TABLE CORRESPONDRE
(
   IDVENTE              VARCHAR(20) NOT NULL,
   IDFACURE             VARCHAR(25) NOT NULL,
   PRIMARY KEY (IDVENTE, IDFACURE)
);

/*==============================================================*/
/* Table : FACTURE                                              */
/*==============================================================*/
CREATE TABLE FACTURE
(
   IDFACURE             VARCHAR(25) NOT NULL,
   DATE_LIVRAISON       DATE NOT NULL,
   SIGNATURECLI         TEXT NOT NULL,
   SIGNATURERESPONSABLE text not null,
   primary key (IDFACURE)
);

/*==============================================================*/
/* Table : INSERER                                              */
/*==============================================================*/
create table INSERER
(
   IDMARCHANDISE        varchar(30) not null,
   IDSTOCKS             varchar(20) not null,
   primary key (IDMARCHANDISE, IDSTOCKS)
);

/*==============================================================*/
/* Table : MARCHANDISES                                         */
/*==============================================================*/
create table MARCHANDISES
(
   IDMARCHANDISE        varchar(30) not null,
   CONTENU              varchar(20) not null,
   POIDSMARC            varchar(1000) not null,
   primary key (IDMARCHANDISE)
);

/*==============================================================*/
/* Table : PANIER                                               */
/*==============================================================*/
create table PANIER
(
   IDPANIER             varchar(20) not null,
   IDMARCHANDISE        varchar(30) not null,
   NBREPANIER           varchar(100) not null,
   primary key (IDPANIER)
);

/*==============================================================*/
/* Table : POSSEDER                                             */
/*==============================================================*/
create table POSSEDER
(
   IDMARCHANDISE        varchar(30) not null,
   IDCENTDISTRIB        varchar(20) not null,
   primary key (IDMARCHANDISE, IDCENTDISTRIB)
);

/*==============================================================*/
/* Table : STOCKS                                               */
/*==============================================================*/
create table STOCKS
(
   IDSTOCKS             varchar(20) not null,
   STOCKMIN             varchar(10) not null,
   STOCKMAX             varchar(100) not null,
   NBREPROD             varchar(50) not null,
   primary key (IDSTOCKS)
);

/*==============================================================*/
/* Table : VENTE                                                */
/*==============================================================*/
create table VENTE
(
   IDVENTE              varchar(20) not null,
   RESPPERSONNEL        varchar(30) not null,
   primary key (IDVENTE)
);

alter table CLIENTS add constraint FK_AVOIR foreign key (IDPANIER)
      references PANIER (IDPANIER) on delete restrict on update restrict;

alter table CLIENTS add constraint FK_RECEVOIR foreign key (IDFACURE)
      references FACTURE (IDFACURE) on delete restrict on update restrict;

alter table COMPRENDRE add constraint FK_COMPRENDRE foreign key (IDVENTE)
      references VENTE (IDVENTE) on delete restrict on update restrict;

alter table COMPRENDRE add constraint FK_COMPRENDRE2 foreign key (IDCENTDISTRIB)
      references CENTRE_DISTRIBUTION (IDCENTDISTRIB) on delete restrict on update restrict;

alter table CORRESPONDRE add constraint FK_CORRESPONDRE foreign key (IDFACURE)
      references FACTURE (IDFACURE) on delete restrict on update restrict;

alter table CORRESPONDRE add constraint FK_CORRESPONDRE2 foreign key (IDVENTE)
      references VENTE (IDVENTE) on delete restrict on update restrict;

alter table INSERER add constraint FK_INSERER foreign key (IDSTOCKS)
      references STOCKS (IDSTOCKS) on delete restrict on update restrict;

alter table INSERER add constraint FK_INSERER2 foreign key (IDMARCHANDISE)
      references MARCHANDISES (IDMARCHANDISE) on delete restrict on update restrict;

alter table PANIER add constraint FK_CONTENIR foreign key (IDMARCHANDISE)
      references MARCHANDISES (IDMARCHANDISE) on delete restrict on update restrict;

alter table POSSEDER add constraint FK_POSSEDER foreign key (IDCENTDISTRIB)
      references CENTRE_DISTRIBUTION (IDCENTDISTRIB) on delete restrict on update restrict;

alter table POSSEDER add constraint FK_POSSEDER2 foreign key (IDMARCHANDISE)
      references MARCHANDISES (IDMARCHANDISE) on delete restrict on update restrict;

