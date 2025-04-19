import cv2 

# Load the image
image = cv2.imread('49251675_Appeal to Action-Authority.png')

# Resize the image to fit within the screen
max_height = 800  # Maximum height for display
scale_factor = max_height / image.shape[0]  # Calculate scale factor based on height
resized_image = cv2.resize(image, None, fx=scale_factor, fy=scale_factor)

# Convert to grayscale
gray = cv2.cvtColor(resized_image, cv2.COLOR_BGR2GRAY)

# Apply Otsu's threshold
thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]

# Find contours
cnts = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
cnts = cnts[0] if len(cnts) == 2 else cnts[1]
for c in cnts:
    x, y, w, h = cv2.boundingRect(c)
    cv2.rectangle(resized_image, (x, y), (x + w, y + h), (36, 255, 12), 2)

# Display the resized images
cv2.imshow('thresh', thresh)
cv2.imshow('image', resized_image)
cv2.waitKey(0)

#cv2.destroyAllWindows()