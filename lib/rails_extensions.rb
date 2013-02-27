class DateTime

  def usec
    case as_time = to_time
    when Time then as_time.usec
    else (sec_fraction * 10**6).to_i
    end
  end

end
