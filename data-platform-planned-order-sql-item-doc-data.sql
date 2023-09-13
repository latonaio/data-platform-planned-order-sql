CREATE TABLE `data_platform_planned_order_item_doc_data`
(
  `PlannedOrder`                   int(16) NOT NULL,
  `PlannedOrderItem`               int(6) NOT NULL,
  `DocType`                        varchar(100) NOT NULL,
  `DocVersionID`                   int(4) NOT NULL,
  `DocID`                          varchar(100) NOT NULL,
  `FileExtension`                  varchar(20) NOT NULL,
  `FileName`                       varchar(200) DEFAULT NULL,
  `FilePath`                       varchar(1000) DEFAULT NULL,
  `DocIssuerBusinessPartner`       int(12) DEFAULT NULL,
  
    PRIMARY KEY (`PlannedOrder`, `PlannedOrderItem`, `DocType`, `DocVersionID`, `DocID`),
    
    CONSTRAINT `DataPlatformPlannedOrderItemDocData_fk` FOREIGN KEY (`PlannedOrder`, `PlannedOrderItem`) REFERENCES `data_platform_planned_order_item_data` (`PlannedOrder`, `PlannedOrderItem`),
    CONSTRAINT `DataPlatformPlannedOrderItemDocDataDocType_fk` FOREIGN KEY (`DocType`) REFERENCES `data_platform_doc_type_doc_type_data` (`DocType`),
    CONSTRAINT `DataPlatformPlannedOrderItemDocDataDocIssuerBusinessPartner_fk` FOREIGN KEY (`DocIssuerBusinessPartner`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
