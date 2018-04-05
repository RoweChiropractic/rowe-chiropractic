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

def fill_in_required_patient_data
  fill_in 'First name', with: first_name
  fill_in 'Last name', with: last_name
end
