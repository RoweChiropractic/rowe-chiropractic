def uuid
  SecureRandom.uuid
end

def pause
  puts 'pausing...'
  STDIN.gets
end

def webkit_debug
  page.driver.enable_logging
end

def wait_until_minute_changes
  minute = Time.now.strftime('%M')
  puts 'Waiting for auto-refresh at minute change...'
  until Time.now.strftime('%M') != minute
    sleep 1
    print '-'
  end
  # wait for the reload...
  sleep 1
end
