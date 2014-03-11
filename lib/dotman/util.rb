module Dotman
  module Util

    extend self

    def red; escape 31; end
    def green; escape 32; end
    def yellow; escape 33; end
    def blue; escape 34; end

    def gray; escape 90; end

    def red_b; bold 31; end
    def green_b; bold 32; end
    def yellow_b; bold 33; end
    def blue_b; bold 34; end
    def white_b; bold 39; end

    def reset; escape 0; end

    def bold n; escape "1;#{n}"; end
    def underline n; escape "4;#{n}"; end
    def escape n; "\033[#{n}m" if $stdout.isatty; end

    def shasum file_path
      Digest::SHA1.file(file_path).hexdigest
    end

    def question prompt = 'Continue?', default = true
      a = ''
      s = default ? '[Y/n]' : '[y/N]'
      d = default ? 'y' : 'n'
      until %w[y n].include? a
        a = ask("#{prompt} #{s} ") { |q| q.limit = 1; q.case = :downcase }
        a = d if a.length == 0
      end
      a == 'y'
    end

  end
end
