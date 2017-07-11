/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.utils;

/**
 *
 * @author Dionatan
 */
public class Mask {   
   public static String CNPJ = "AA.AAA.AAA/AAAA-AA";
   public static String TELEFONE = "(AA) AAAAA-AAAA";
   
    public static String formatString(String string, String mask) throws java.text.ParseException {
     javax.swing.text.MaskFormatter mf = new javax.swing.text.MaskFormatter(mask);
     mf.setValueContainsLiteralCharacters(false);
     return mf.valueToString(string);
   }
}
