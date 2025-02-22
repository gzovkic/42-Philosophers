CC = cc
CFLAGS = -Wall -Werror -Wextra -g #-fsanitize=address

LIBFT_DIR = ./libft
LIBFT = $(LIBFT_DIR)/libft.a

SRC_DIR = src
OBJ_DIR = obj

SRCS = main.c

NAME = philosopher

OBJS = $(patsubst %.c, $(OBJ_DIR)/%.o, $(SRCS))

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LIBFT)
	@echo "Executable $(NAME) created."

all: $(NAME)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

clean:
	@rm -f $(OBJS)
	$(MAKE) -C $(LIBFT_DIR) clean
	@echo "Object files removed."

fclean: clean
	@rm -f $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean
	@echo "All generated files removed."

re: fclean all

.PHONY: all clean fclean re
