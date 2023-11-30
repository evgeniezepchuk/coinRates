//
//  Model.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 28.10.23.
//

import Foundation

struct Models: Codable {
    let rates: [Model]
}

struct Model: Codable {
    let USD_in: String?
    let USD_out: String?
    let EUR_in: String?
    let EUR_out: String?
    let name: String?
    let name_type: String?
    let street_type: String?
    let street: String?
    let home_number: String?
    let filial_id: String?
    let info_worktime: String?
    let filials_text: String?
}

/*
 "USD_in":"3.1700",
       "USD_out":"3.2300",
       "EUR_in":"3.3300",
       "EUR_out":"3.4000",
       "RUB_in":"3.3400",
       "RUB_out":"3.4300",
       "GBP_in":"3.4500",
       "GBP_out":"3.8900",
       "CAD_in":"0.0000",
       "CAD_out":"0.0000",
       "PLN_in":"7.2500",
       "PLN_out":"7.6500",
       "SEK_in":"0.0000",
       "SEK_out":"0.0000",
       "CHF_in":"0.0000",
       "CHF_out":"0.0000",
       "USD_EUR_in":"0.9460",
       "USD_EUR_out":"1.0440",
       "USD_RUB_in":"92.5000",
       "USD_RUB_out":"0.0104",
       "RUB_EUR_in":"0.0099",
       "RUB_EUR_out":"97.1000",
       "JPY_in":"0.0000",
       "JPY_out":"0.0000",
       "CNY_in":"4.3500",
       "CNY_out":"4.5700",
       "CNY_EUR_in":"0.0000",
       "CNY_EUR_out":"0.0000",
       "CNY_USD_in":"0.0000",
       "CNY_USD_out":"0.0000",
       "CNY_RUB_in":"0.0000",
       "CNY_RUB_out":"0.0000",
       "CZK_in":"0.0000",
       "CZK_out":"0.0000",
       "NOK_in":"0.0000",
       "NOK_out":"0.0000",
       "filial_id":"16",
       "sap_id":"50011756",
       "info_worktime":"Пн 09 00 19 00    |Вт 09 00 19 00    |Ср 09 00 19 00    |Чт 09 00 19 00    |Пт 09 00 19 00    |Сб 10 00 15 00    |Вс        |",
       "street_type":"пр.",
       "street":"Партизанский",
       "filials_text":"Отделение 100\/1050",
       "home_number":"8-49",
       "name":"Брест",
       "name_type":"г.
 */
