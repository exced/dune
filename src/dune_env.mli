open! Stdune

type stanza = Stanza.t = ..

module Stanza : sig
  type config =
    { flags          : Ordered_set_lang.Unexpanded.t
    ; ocamlc_flags   : Ordered_set_lang.Unexpanded.t
    ; ocamlopt_flags : Ordered_set_lang.Unexpanded.t
    }

  type pattern =
    | Profile of string
    | Any

  type t =
    { loc   : Loc.t
    ; rules : (pattern * config) list
    }

  val decode : t Dune_lang.Decoder.t
end

type stanza +=
  | T of Stanza.t
