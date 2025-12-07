# Use official Nginx image as base

# Alpine variant is lightweight (~5MB) and secure

FROM nginx:alpine
 
# Set metadata for the image

LABEL maintainer="harshit1707"

LABEL description="Simple web app for DevOps CI/CD pipeline demo"

LABEL version="1.0"
 
# Copy the HTML file from local directory to Nginx's default serving directory

# Nginx serves files from /usr/share/nginx/html/ by default

COPY index.html /usr/share/nginx/html/
 
# Expose port 80 to allow external access

# This is the default HTTP port that Nginx listens on

EXPOSE 80
 
# Health check to verify container is running properly

# This checks if Nginx is responding on port 80 every 30 seconds

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \

  CMD wget --quiet --tries=1 --spider http://localhost:80/ || exit 1
 
# Start Nginx in the foreground

# "daemon off" keeps Nginx running in foreground (required for Docker)

CMD ["nginx", "-g", "daemon off;"]
 