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

NAME = libft.a

CFLAGS = -Iinc -Wall -Werror -Wextra

SRCDIR	= src/
OBJDIR	= bin/
HDRDIR	= inc/

INCLUDES = $(addprefix $(HDRDIR), \
	libft.h \
)
# Add the path to your source files in the src folder
SRCS = $(addprefix $(SRCDIR), \
	ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c\
ft_memchr.c ft_memcmp.c ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c\
ft_strrchr.c ft_strnstr.c ft_strncmp.c ft_atoi.c ft_isalpha.c ft_isdigit.c\
ft_isalnum.c ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c ft_calloc.c\
ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c\
ft_strmapi.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c\
)

# String manipulation magic
SRC		:= $(notdir $(SRCS))
OBJ		:= $(SRC:.c=.o)
OBJS	:= $(addprefix $(OBJDIR), $(OBJ))

all: $(NAME)

$(NAME): $(OBJS) $(INCLUDES) $(SRCS)
	ar rcs $(NAME) $(OBJS)

$(OBJDIR)%.o : $(SRCDIR)%.c $(INCLUDES)
	@mkdir -p $(OBJDIR)
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -rf $(OBJDIR)

fclean: clean
	@rm -rf $(NAME)

re: fclean all

.PHONY	= all run clean fclean re