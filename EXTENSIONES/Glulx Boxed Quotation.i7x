Version 2 of Glulx Boxed Quotation (for Glulx only) by Eliuk Blau begins here.

"This extension allows the use of Z-Machine style boxed quotations under Glulx."

[==============================================================================]
[==============================================================================]

Section 0 - Glulx Boxed Quotation Header Comment (in Spanish) - Unindexed

[===============================================================================
!  DREAMBYTES ADVENTURES: GLULX BOXED QUOTATION FOR INFORM 7
!  Codigo Fuente
!===============================================================================
!
!  Archivo :  Glulx Boxed Quotation.i7x
!  Fecha   :  2009/03/19
!  Version :  2
!  Autor   :  Eliuk Blau
!  e-Mail  :  eliukblau (AT) gmail.com
!
!===============================================================================
!
!  Log:
!  2009/03/19  Eliuk Blau - Nuevo Release: ** Glulx Boxed Quotation v2 **
!                         - Se corrigen algunas mensajes mal escritos.
!                         - Se incorpora la posibilidad de evitar el
!                           recuadro ASCII en las cajas de texto.
!  2009/02/25  Eliuk Blau - Primer Release: ** Glulx Boxed Quotation v1 **
!                         - Se crea el archivo.
]
[==============================================================================]
[==============================================================================]

Part 1 - Glulx Boxed Quotation Entry Points - Unindexed

Include Glulx Entry Points by Emily Short.

The redraw boxed quotation rule is listed first in the glulx arranging rules.

A glulx arranging rule (this is the redraw boxed quotation rule):
  boxed-quotation-redraw.

To boxed-quotation-redraw:
  (- if (gg_quotewin) { Box__Routine(_CurrQuoteMaxLen_, _CurrQuoteArr_); } -)

[==============================================================================]
[==============================================================================]

Part 2 - Use Options

Use boxed quotation without frame translates as (- Constant GBOXQUOTE_NOFRAME; -).

[==============================================================================]
[==============================================================================]

Part 3 - Some Useful Phrases (for use without Basic Screen Effects by Emily Short)

To show the/-- current quotation:
  (- ClearBoxedText(); -)

[==============================================================================]
[==============================================================================]

Part 4 - Glulx Boxed Quotation I6 Hack - Unindexed

Include (- Replace Box__Routine; -) before "Glulx.i6t".

Include (-

Global _CurrQuoteArr_;
Global _CurrQuoteMaxLen_;

Array _GlulxBoxQuoteAux_ -> 4;

[ Box__Routine maxlen arr
    i aux lines linelen winwide indent lastnl parwin;

    _CurrQuoteArr_ = arr;
    _CurrQuoteMaxLen_ = maxlen;

    indent = 4;
    lastnl = true;
    lines = arr-->0;

    if (gg_quotewin == 0) {
        gg_arguments-->0 = lines;
        i = InitGlkWindow(GG_QUOTEWIN_ROCK);
        if (i == 0) {
          glk_stylehint_set(
            wintype_TextGrid, style_Normal,
            stylehint_ReverseColor, 0
          );
          glk_stylehint_set(
            wintype_TextGrid, style_BlockQuote,
            stylehint_ReverseColor, 1
          );
          gg_quotewin = glk_window_open(
            gg_mainwin, winmethod_Fixed+winmethod_Above,
            lines+4, wintype_TextGrid, GG_QUOTEWIN_ROCK
          );
        }
    }
    else {
      parwin = glk_window_get_parent(gg_quotewin);
      glk_window_set_arrangement(parwin, $12, lines+4, 0);
    }

    if (gg_quotewin) {
      glk_window_get_size(gg_quotewin, gg_arguments, 0);
      winwide = gg_arguments-->0;
      indent = (winwide-(maxlen+4))/2;
      glk_window_clear(gg_quotewin);
      glk_set_window(gg_quotewin);
      lastnl = false;
    }

    new_line; if (lastnl) { new_line; }
    if (gg_quotewin) {
      glk_set_style(style_Normal); spaces indent;
      glk_set_style(style_BlockQuote);
    }
    else {
      glk_set_style(style_Preformatted);
      spaces indent;
    }

    #ifdef GBOXQUOTE_NOFRAME;
      spaces maxlen+4;
    #ifnot;
      print (char) 43;
      for (aux=0 : aux<maxlen+2 : aux=aux+1) { print (char) 45; }
      print (char) 43;
    #endif; ! GBOXQUOTE_NOFRAME

    glk_set_style(style_Normal);
    new_line;

    for (i=0 : i<lines : i=i+1) {
      (arr-->(i+1)).print_to_array(_GlulxBoxQuoteAux_,4);
      linelen = _GlulxBoxQuoteAux_-->0;
      if (gg_quotewin) {
        glk_set_style(style_Normal); spaces indent;
        glk_set_style(style_BlockQuote);
      }
      else {
        glk_set_style(style_Preformatted);
        spaces indent;
      }

      #ifdef GBOXQUOTE_NOFRAME;
        spaces 2;
      #ifnot;
        print (char) 124, (char) 32;
      #endif; ! GBOXQUOTE_NOFRAME

      print (string) arr-->(i+1);
      spaces (maxlen-linelen);

      #ifdef GBOXQUOTE_NOFRAME;
        spaces 2;
      #ifnot;
        print (char) 32, (char) 124;
      #endif; ! GBOXQUOTE_NOFRAME

      glk_set_style(style_Normal);
      new_line;
    }

    if (gg_quotewin) {
      glk_set_style(style_Normal); spaces indent;
      glk_set_style(style_BlockQuote);
    }
    else {
      glk_set_style(style_Preformatted);
      spaces indent;
    }

    #ifdef GBOXQUOTE_NOFRAME;
      spaces maxlen+4;
    #ifnot;
      print (char) 43;
      for (aux=0 : aux<maxlen+2 : aux=aux+1) { print (char) 45; }
      print (char) 43;
    #endif; ! GBOXQUOTE_NOFRAME

    glk_set_style(style_Normal);
    new_line; if (lastnl) { new_line; }

    if (gg_quotewin) { glk_set_window(gg_mainwin); }
];

-) after "Glulx.i6t".

Glulx Boxed Quotation ends here.

[==============================================================================]
[==============================================================================]

---- DOCUMENTATION ----

The boxed quotation would be shown properly in any Glulx interpreter supporting the "ReverseColor" Glk stylehint. In order to obtain the same feature even in those interpreters not supporting that stylehint, the quotation will be ever surrounded by "ASCII art" frame. (This extension will work even in that "Glulx incomplete" clients.)

The boxed quotation in Inform 7 are normally drawn just after the prompt, but now we can force the drawing of the quotation in any moment, using the phrase:

	show the current quotation

Additionally, we can disable the "ASCII art" frame that surround the quotation (not recommended), using the option:

	Use boxed quotation without frame.

Thanks to Mel Hython for crying the development of that extension. His annoying noise give me a lot of motivation.
