//
//  UITableViewCell+ReusableCellProtocol.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 29/01/24.

//checkBox Multiple
//radioButton 1
// Una celda, con ul titulo y asu lado derecho un boton con una flecha que indica abajo.Cuando la 2 celda este activa el botton image tendra la fecha arriba. Presionas el boton, eso hace que aparezca la segunda celda. De ahi hacia abajo. Lista de seleccion unica o solo puede ser seleccion multiples veces.
// El subtitulo tiene que tener el nombre de la seleccion unica radioButton. Cuando es checkBox el texto del subtitulo dira 4 seleccionadas. Cuando no hay ninguno no se ve nada.
//Guardar las selecciones guardadas.
import UIKit

extension UITableViewCell: TBSGReusableCellProtocol {}
