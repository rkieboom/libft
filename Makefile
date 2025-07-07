# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: rkieboom <rkieboom@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2019/11/25 11:00:12 by rkieboom       #+#    #+#                 #
#    Updated: 2019/11/29 16:06:44 by rkieboom      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME := libft.a

CC := gcc
CFLAGS := -Wall -Werror -Wextra

SRCDIR	:= src
OBJDIR	:= bin
HDRDIR	:= inc
PRINTF_DIR := printf



SRC_FILES := ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c\
ft_memchr.c ft_memcmp.c ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c\
ft_strrchr.c ft_strnstr.c ft_strncmp.c ft_atoi.c ft_isalpha.c ft_isdigit.c\
ft_isalnum.c ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c ft_calloc.c\
ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c\
ft_strmapi.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c\
get_next_line.c

SRC_FILES := $(addprefix $(SRCDIR)/, $(SRC_FILES))
OBJ_FILES := $(addprefix $(OBJDIR)/, $(notdir $(SRC_FILES:.c=.o)))

all: $(NAME)

PRINTF_OBJS := $(addprefix $(PRINTF_DIR)/, $(shell $(MAKE) -C $(PRINTF_DIR) print-objects))

$(NAME): $(OBJ_FILES) $(PRINTF_OBJS) #New
	ar rcs $(NAME) $(OBJ_FILES) $(PRINTF_OBJS)

$(PRINTF_OBJS): #New
	$(MAKE) -C $(PRINTF_DIR) build-objects


# $(NAME): $(OBJ_FILES) build-printf
#	# ar rcs $(NAME) $(OBJ_FILES) $(addprefix $(PRINTF_DIR)/, $(shell $(MAKE) -C $(PRINTF_DIR) print-objects))

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@ -Iinc

build-printf: $(PRINTF_DIR)
	$(MAKE) -C $(PRINTF_DIR) build-objects

$(PRINTF_DIR):
	$(MAKE) init-submodules

init-submodules:
	git submodule update --init --recursive

update-submodules:
	git submodule update --remote --recursive

clean:
	@rm -rf $(OBJDIR)
	@$(MAKE) -C $(PRINTF_DIR) clean

fclean: clean
	@rm -rf $(NAME)
	@$(MAKE) -C $(PRINTF_DIR) fclean

re: fclean all

.PHONY	= all run clean fclean re printf