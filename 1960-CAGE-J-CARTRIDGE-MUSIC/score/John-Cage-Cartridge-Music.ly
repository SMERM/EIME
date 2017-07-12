\version "2.18.2"

\header {
  title = "Cartridge Music"
  composer = "John Cage"
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "a3" 'landscape)
  ragged-right = ##f
  ragged-last = ##f
  ragged-bottom = ##f
  ragged-last-bottom = ##f
  right-margin = 0.25\in
  left-margin = 1\in
  bottom-margin = 0.35\in
  top-margin = 0.35\in
  
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \fill-line { " " }
  evenHeaderMarkup = \markup \fill-line { " " }
  oddFooterMarkup = \markup { \fill-line {
     \bold \fontsize #3 \on-the-fly #print-page-number-check-first
     \fromproperty #'page:page-number-string } }
  evenFooterMarkup = \markup { \fill-line {
     \bold \fontsize #3 \on-the-fly #print-page-number-check-first
     \fromproperty #'page:page-number-string } }
}

global = {
  \key c \major
  \time 4/4
}

drumDrumsI = \drummode {
  \global
  % Drums follow here.
  \override Score.BarNumber.break-visibility = #all-visible
  \set Score.barNumberVisibility = #(every-nth-bar-number-visible 1)
  % Increase the size of the bar number by 2
  \override Score.BarNumber.font-size = #5
  \override Score.BarNumber.self-alignment-X = #CENTER
  \set Score.markFormatter = #format-mark-numbers
  \set Score.currentBarNumber = #0
  
  \repeat unfold 3 {s1 s1 s1 s1 s1 \break}
  
}

drumsIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "ENV IV"
  shortInstrumentName = "IV"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsIIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "ENV III"
  shortInstrumentName = "III"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsIIIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "L"
  shortInstrumentName = "L"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsIVPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "I"
  shortInstrumentName = "I"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsVPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "H"
  shortInstrumentName = "H"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsVIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "G"
  shortInstrumentName = "G"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsVIIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "F"
  shortInstrumentName = "F"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsVIIIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "MIX"
  shortInstrumentName = "MIX"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsVIIIaPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "TONE"
  shortInstrumentName = "TONE"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsIXPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "E"
  shortInstrumentName = "E"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsXPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "D"
  shortInstrumentName = "D"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsXIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "C"
  shortInstrumentName = "C"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsXIIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "B"
  shortInstrumentName = "B"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsXIIIPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "A"
  shortInstrumentName = "A"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsXIVPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "ENV II"
  shortInstrumentName = "II"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

drumsXVPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "ENV I"
  shortInstrumentName = "I"
  drumStyleTable = #bongos-style
  \override StaffSymbol #'line-count = #2
  \override StaffSymbol.staff-space = #7
  \override Stem #'stencil = ##f
  \override Stem #'length = #3  % keep some distance.
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} \drumDrumsI

\score {
  \new StaffGroup <<
    \drumsIPart
    \drumsIIPart
    \drumsIIIPart
    \drumsIVPart
    \drumsVPart
    \drumsVIPart
    \drumsVIIPart
    \drumsVIIIPart
    \drumsVIIIaPart
    \drumsIXPart
    \drumsXPart
    \drumsXIPart
    \drumsXIIPart
    \drumsXIIIPart
    \drumsXIVPart
    \drumsXVPart
  >>
  \layout {
    indent = 0.0\cm
  \context {
    \Score
    \override StaffGrouper.staff-staff-spacing.padding = #0
    \override StaffGrouper.staff-staff-spacing.basic-distance = #7
  }}
}
