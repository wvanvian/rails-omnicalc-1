class PageController < ApplicationController
  def format_number(number)
    number_list = number.to_s.split(".")
    num_groups = number_list[0].to_s.chars.to_a.reverse.each_slice(3)
    num_groups.map(&:join).join(',').reverse
  end

  def get_decimals(number)
    number_list = number.to_s.split(".")
    output = ""
    if number_list[1].length() == 1
      output = output + '.' + number_list[1] + '0'
    else
      output = output + '.' + number_list[1]
    end

  end

  def default
    render(:template => "main/home_page")
  end

  def square
    render(:template => "main/square")
  end

  def square_results
    @num = params.fetch("number").to_f
    @square = @num ** 2
    render(:template => "main/square_results")
  end

  def square_root
    render(:template => "main/square_root")
  end

  def square_root_results
    @num = params.fetch("user_number").to_f
    @root = Math.sqrt(@num)

    render(:template => "main/square_root_results")
  end

  def payment
    render(:template => "main/payment")
  end

  def payment_results
    @apr = params.fetch("user_apr").to_f
    r = @apr/1200
    @year = params.fetch("user_years").to_i
    @pv = params.fetch("user_pv").to_f

    @payment = (r * @pv/(1-(1+r)**(-@year*12)))
    # @pv = format_number(@pv).to_s + get_decimals(@pv)
    # @apr = @apr.round(4)
    # @payment = format_number(@payment).to_s + get_decimals(@payment)
    # render(:template => "main/payment_results")

    # @payment = (r * @pv/(1-(1+r)**(-@year*12))).round(2)
    # @pv = format_number(@pv).to_s + get_decimals(@pv)
    # @apr = @apr.round(4)
    # @payment = format_number(@payment).to_s + get_decimals(@payment)
    render(:template => "main/payment_results")
  end

  def random_number
    render(:template => "main/random_number")
  end

  def random_number_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @rand = rand(@min..@max)
    render(:template => "main/random_number_results")
  end
  
end
