# Use the official Ruby 2.7 image based on Debian Buster
FROM ruby:3.2.2

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Install necessary packages
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        build-essential \
        nodejs \
        vim \
    && rm -rf /var/lib/apt/lists/*

# Install Bundler
RUN gem install bundler -v '2.3.0'

# Copy the application code to the container
COPY . /app

# Install gem dependencies
RUN bundle install --path vendor/bundle

# Expose port 3000
EXPOSE 3000

# Set the default command to run your application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
