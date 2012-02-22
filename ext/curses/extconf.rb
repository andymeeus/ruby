require 'mkmf'

def transact
  old_libs = $libs.dup
  old_defs = $defs.dup
  result = yield
  if !result
    $libs = old_libs
    $defs = old_defs
  end
  result
end

def check_header_library(hdr, libs)
  if !have_header(hdr)
    return nil
  end
  libs.each {|lib|
    if have_library(lib, "initscr")
      return [hdr, lib]
    end
  }
  nil
end

dir_config('curses')
dir_config('ncurses')
dir_config('termcap')

have_library("mytinfo", "tgetent") if /bow/ =~ RUBY_PLATFORM
have_library("tinfo", "tgetent") or have_library("termcap", "tgetent")

header_library = nil
[
  ["ncurses.h", ["ncursesw", "ncurses"]],
  ["ncurses/curses.h", ["ncurses"]],
  ["curses_colr/curses.h", ["cur_colr"]],
  ["curses.h", ["curses"]],
].each {|hdr, libs|
  header_library = transact { check_header_library(hdr, libs) }
  if header_library
    break;
  end
}

if header_library
  header, _ = header_library
  curses = [header]
  if header == 'curses_colr/curses.h'
    curses.unshift("varargs.h")
  end

  for f in %w(beep bkgd bkgdset curs_set deleteln doupdate flash
              getbkgd getnstr init isendwin keyname keypad resizeterm
              scrl set setscrreg ungetch
              wattroff wattron wattrset wbkgd wbkgdset wdeleteln wgetnstr
              wresize wscrl wsetscrreg
              def_prog_mode reset_prog_mode timeout wtimeout nodelay
              init_color wcolor_set use_default_colors newpad)
    have_func(f) || (have_macro(f, curses) && $defs.push(format("-DHAVE_%s", f.upcase)))
  end
  flag = "-D_XOPEN_SOURCE_EXTENDED"
  if try_static_assert("sizeof(char*)>sizeof(int)",
                       %w[stdio.h stdlib.h]+curses,
                       flag)
    $defs << flag
  end
  have_var("ESCDELAY", curses)
  have_var("TABSIZE", curses)
  have_var("COLORS", curses)
  have_var("COLOR_PAIRS", curses)
  create_makefile("curses")
end
