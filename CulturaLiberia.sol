// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaLiberia
 * @dev Registro de procesos mecanicos de extraccion de almidon y estabilidad lipidica.
 * Serie: Sabores de Africa (44/54)
 */
contract CulturaLiberia {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 elasticidadAlmidon;  // Nivel de alineacion de cadenas de polimeros (1-100)
        uint256 saturacionGrasas;    // Estabilidad del aceite de palma (1-10)
        bool requiereGolpeadoMecanico; // Proceso manual de transformacion fisica
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Dumboy (Ingenieria Reologica)
        registrarPlato(
            "Dumboy", 
            "Yuca fresca (mandioca), agua.",
            "Yuca hervida y golpeada vigorosamente en un mortero hasta transformar el almidon en una masa elastica y viscosa.",
            98, 
            1, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _elasticidad, 
        uint256 _saturacion,
        bool _mecanico
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_elasticidad <= 100, "Escala de elasticidad excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            elasticidadAlmidon: _elasticidad,
            saturacionGrasas: _saturacion,
            requiereGolpeadoMecanico: _mecanico,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
